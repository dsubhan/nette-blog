<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;
use Nette\Security\SimpleIdentity;
use App\Model\PostFacade;
use Nette\Security\AuthenticationException;

/**
 * Docs
 */
final class SignPresenter extends Nette\Application\UI\Presenter
{

	private $database;
	private PostFacade $facade;
	private $passwords;

	public function __construct(Nette\Database\Explorer $database, Nette\Security\Passwords $passwords, PostFacade $facade)
	{
		$this->database = $database;
		$this->passwords = $passwords;
		$this->facade = $facade;
	}

	public function authenticate(string $username, string $password): SimpleIdentity
	{
		$row = $this->facade->get_user($username);

		if (!$row) {
			throw new Nette\Security\AuthenticationException('Uživatel nenalezen');
		}
		if (!$this->passwords->verify($password, $row->psswd)) {
			throw new Nette\Security\AuthenticationException('Nesprávné heslo');
		}

		return new SimpleIdentity(
			$row->id,
			$row->role, // or array of roles
			['name' => $row->username],
		);
	}

	public function signInFormSucceeded(Form $form, \stdClass $data): void
	{
		try {
			$identity = $this->authenticate($data->username, $data->password);
			$this->getUser()->login($identity);
			$this->redirect('Homepage:');
		} catch (Nette\Security\AuthenticationException $e) {
			$form->addError('Špatná kombinace hesla a jména ');
		}

	}

	public function signUpFormSucceeded(Form $form, \stdClass $data): void
	{
		try {
			if($this->facade->get_user($data->username)){
				$form->addError("Uživatel již existuje");
			}
			else{
				$pwd = $this->passwords->hash($data->password);
				$this->database->query("Insert into users ",  ["username" => $data->username, "psswd"=> $pwd, "role" => "user"]);
				$identity = $this->authenticate($data->username, $data->password);
				$this->getUser()->login($identity);
				$this->redirect('Homepage:');
			}
		} catch (Nette\Security\AuthenticationException $e) {
			$form->addError('Uživatel již existuje');
		}

	}

	public function actionOut(): void
	{
		$this->getUser()->logout();
		$this->flashMessage('Odhlášení proběhlo úspěšně');
		$this->redirect('Homepage:');
	}

	/**
	 * Sign-in form factory.
	 */
	protected function createComponentSignInForm(): Form
	{
		$form = new Form;
		$form->addText('username', 'Uživatelské jméno:')
			->setRequired('Prosím zadejte své uživatelské jméno');

		$form->addPassword('password', 'Heslo:')
			->setRequired('Prosím zadejte své heslo');

		$form->addSubmit('send', 'Přihlásit se');

		// call method signInFormSucceeded() on success
		$form->onSuccess[] = [$this, 'signInFormSucceeded'];
		return $form;
	}

	protected function createComponentSignUpForm(): Form
	{
		$form = new Form;
		$form->addText('username', 'Uživatelské jméno:')
			->setRequired('Prosím zadejte své uživatelské jméno');

		$form->addPassword('password', 'Heslo:')
			->setRequired('Prosím zadejte své heslo');

		$form->addSubmit('send', 'Registrovat');

		// call method signInFormSucceeded() on success
		$form->onSuccess[] = [$this, 'signUpFormSucceeded'];
		return $form;
	}


}
